module SourceableConcerns
  extend ActiveSupport::Concern

  def generate_code resource, limit=4
    case resource.name
    when 'Group'
      prefix = 'G'
    when 'Room'
      prefix = 'R'
    when 'User'
      prefix = 'U'
    end

    codes  = [('0'..'9'), ('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten

    begin
      Rails.logger.debug { " -- prefix: #{prefix}" }
      Rails.logger.debug { " -- codes.sample(limit).join(''): #{codes.sample(limit).join('')}" }
      code = prefix + codes.sample(limit).join('')
    end while User.where(code: code).count > 0

    self.code = code
  end
end
