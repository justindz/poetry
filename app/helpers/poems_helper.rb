module PoemsHelper
  def search_excerpt(text, phrase, radius = 100, excerpt_string = "...")
    if text.nil? || phrase.nil? then return end
    phrase = Regexp.escape(phrase)
    
    if found_pos = text.chars =~ /(\W+#{phrase}\W+)/i
      start_pos = [ found_pos - radius, 0 ].max
      end_pos   = [ found_pos + phrase.chars.length + radius, text.chars.length ].min
      
      prefix  = start_pos > 0 ? excerpt_string : ""
      postfix = end_pos < text.chars.length ? excerpt_string : ""
      
      prefix + text.chars[start_pos..end_pos].strip + postfix
    else
      nil
    end
  end

  def search_highlight(text, phrases, highlighter = '<strong class="highlight">\1</strong>')
    if text.blank? || phrases.blank?
      text
    else
      match = Array(phrases).map { |p| Regexp.escape(p) }.join('|')
      text.gsub(/(\W+#{match}\W+)/i, highlighter)
    end
  end
end
