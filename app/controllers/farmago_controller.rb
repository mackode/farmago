require 'net/http'
require 'open-uri'
require 'timeout'


class FarmagoController < ApplicationController
	def drugs
		@drugs = RefundedDrug.all
		render json: @drugs
  	end

	def search
		#YourModelName.where("yourFieldName like ?", "%" + yourSearchTerm + "%")
		s = "%" + params[:search] + "%"
		@drugs = RefundedDrug.where("drug_name LIKE ? OR active_substance LIKE ? OR limited_group LIKE ? OR indications_range LIKE ? OR other_indications LIKE ?", s, s, s, s, s)
    	render search: params[:search].inspect
	end

	def leaflet
		begin
			status = Timeout::timeout(5) {
				tmp_path = "tmp/"
				base_url = "http://leki.urpl.gov.pl"
				uri = URI.parse(base_url + "/index.php")
				http = Net::HTTP.new(uri.host, uri.port)

				request = Net::HTTP::Post.new(uri.request_uri)
				request.set_form_data({"szukacz" => params[:ean], "kategoria" => "EAN"})

				response = http.request(request)
				pdf_re = /\"window\.open\('\/\w+\/\w+.pdf'\)\"/  
				match = pdf_re.match(response.body)
		
				pdf_from_match = match[0].split("'")[1]
				pdf_file_name = File.basename(pdf_from_match)
				pdf_url = base_url + pdf_from_match

				open(tmp_path + pdf_file_name, 'wb') do |file|
  					file << open(pdf_url).read
				end

				result = system("pdftohtml " + tmp_path + pdf_file_name)
				base_name = pdf_file_name.split(".")[0]
				html_file_path = tmp_path + base_name + "s.html"

				render :file => html_file_path
			}
		rescue
			render :file => "app/views/farmago/brak_ulotki.html"
		end
	end

	def index
	end
end
