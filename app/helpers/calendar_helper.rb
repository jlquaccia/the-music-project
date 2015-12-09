module CalendarHelper
  def location_info(rsvp_url)
    @fb_rsvp_page = rsvp_url if @fb_rsvp_page != []
    page = Nokogiri::HTML(open(@fb_rsvp_page))
    v = page.css(".event-venue a")[0].text.strip
    c = page.css(".event-venue a")[1].text.strip

    venue = v.gsub(/[&]/, 'and')
    city = c.gsub(/[&]/, 'and')

    content_tag :a, "Directions", href: "http://maps.google.com/maps?saddr=current%20location&daddr=#{venue}+#{city}&hl=en"
  end
end