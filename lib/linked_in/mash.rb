module LinkedIn
  # Coerces LinkedIn JSON to a nice Ruby hash
  # LinkedIn::Mash inherits from Hashie::Mash
  class Mash < ::Hashie::Mash

    # a simple helper to convert a json string to a Mash
    def self.from_json(json_string)
      result_hash = JSON.load(json_string)
      new(result_hash)
    end

    # returns a Date if we have year, month and day, and no conflicting key
    def to_date
      if !self.has_key?('to_date') && contains_date_fields?
        Date.civil(self.year, self.month, self.day)
      else
        super
      end
    end

    def timestamp
      value = self['timestamp']
      if value.kind_of? Integer
        value = value / 1000 if value > 9999999999
        Time.at(value)
      else
        value
      end
    end


    protected ############################################################


    def contains_date_fields?
      self.year? && self.month? && self.day?
    end
  end
end
