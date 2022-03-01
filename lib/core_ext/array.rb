# frozen_string_literal: true

class Array
  def median
    return if empty?
    raise "requires all number" unless all?(Numeric)

    sorted = sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end

  def mean
    return if empty?

    sum / size
  end
end
