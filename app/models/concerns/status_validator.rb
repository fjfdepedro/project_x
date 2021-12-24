class StatusValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)
    unless %w[pending cancelled completed dirbursed].include? value
      record.errors.add(attr_name, :status, **options.merge(value: value))
    end
  end
end