require 'csv'

class MintConverter

  DEFAULTS = {}

  def initialize(raw_data, logger, opts={})
    @opts = DEFAULTS.merge(opts)
    @logger = logger
    @raw_data = raw_data
  end

  # very basic method to negate the Amount column if the Transaction Type is a credit.
  def convert_credits_to_negative
    CSV.foreach(@raw_data, headers: true, skip_blanks: true).each do |row|
      next if row.to_hash.values.all?(&:empty?)
      if row["Transaction Type"] == "credit" && !row["Amount"].start_with?("-")
        row["Amount"] = (-row["Amount"].to_f).to_s
      end
      puts row
    end
  end
end
