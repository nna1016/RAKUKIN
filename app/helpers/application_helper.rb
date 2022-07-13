module ApplicationHelper
    require 'rqrcode'
    require 'rqrcode_png'

    def qrcode(text, options = {})
        ::RQRCode::QRCode.new(text, options).as_svg.html_safe
    end
end
