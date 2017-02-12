module Common
  module Mixin
    module ModelId
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      def mid
        self.id.to_s if self.id
      end

      module ClassMethods
        def find_by_id(id)
          return nil unless id
          self.where(id: id).first
        end
      #
      #   def find_all_by_id(ids)
      #     return [] unless ids
      #     self.in(id: ids).sort_by { |model| ids.index(model.mid) }
      #   end
      #
      #   def from_secondary
      #     self.with(read: :secondary_preferred)
      #   end
      #
      #   def from_primary
      #     self.with(read: :primary_preferred)
      #   end
      #
      #   def from_nearest
      #     self.with(read: :nearest)
      #   end
      end
    end
  end
end
