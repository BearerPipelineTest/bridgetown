# frozen_string_literal: true

class Builders::Toc < SiteBuilder
  def build
    liquid_tag "toc", :toc_template
    helper "toc", :toc_template
  end

  def toc_template(*)
    <<~MD
      ## Table of Contents
      {:.no_toc}
      * …
      {:toc}
    MD
  end
end
