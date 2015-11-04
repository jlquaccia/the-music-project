module ApplicationHelper
  def hash_version_to_commas(hash)
    ids = hash.map{|x| x["id"]}
    ids.join(",").html_safe
  end
end