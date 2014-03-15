module Renumber
  module RenumberMethods
    def renumber_array(array)
      array.each_with_index do |obj, i|
        count = (i + 1) * 10
        unless obj.sort_order == count
          obj.sort_order = count
          obj.save
        end
      end
    end
  end
  extend RenumberMethods
end
