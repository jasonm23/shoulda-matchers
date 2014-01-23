module Shoulda
  module Matchers
    module ActiveModel
      # The `ensure_inclusion_of` matcher tests usage of the
      # `validates_inclusion_of` validation, asserting that an attribute can
      # take a whitelist of values and cannot take values outside of this list.
      #
      # ## Qualifiers
      #
      # `in_array` or `in_range` are used to test usage of the `:in` option,
      # and so one must be used.
      #
      # ### in_array
      #
      # Use `in_array` if your whitelist is an array of values.
      #
      #     class Issue
      #       include ActiveModel::Model
      #
      #       validates_inclusion_of :state, in: %w(open resolved unresolved)
      #     end
      #
      #     # RSpec
      #     describe Issue do
      #       it { should ensure_inclusion_of(:state).in_array(%w(open resolved unresolved)) }
      #     end
      #
      #     # Test::Unit
      #     class IssueTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:state).in_array(%w(open resolved unresolved))
      #     end
      #
      # ### in_range
      #
      # Use `in_range` if your whitelist is a range of values.
      #
      #     class Issue
      #       include ActiveModel::Model
      #
      #       validates_inclusion_of :priority, in: 1..5
      #     end
      #
      #     # RSpec
      #     describe Issue do
      #       it { should ensure_inclusion_of(:state).in_range(1..5) }
      #     end
      #
      #     # Test::Unit
      #     class IssueTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:state).in_range(1..5)
      #     end
      #
      # ### with_message
      #
      # Use `with_message` if you are using a custom validation message.
      #
      #     class Issue
      #       include ActiveModel::Model
      #
      #       validates_inclusion_of :severity,
      #         in: %w(low medium high),
      #         message: 'Severity must be low, medium, or high'
      #     end
      #
      #     # RSpec
      #     describe Issue do
      #       it do
      #         should ensure_inclusion_of(:severity).
      #           in_array(%w(low medium high)).
      #           with_message('Severity must be low, medium, or high')
      #       end
      #     end
      #
      #     # Test::Unit
      #     class IssueTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:severity).
      #         in_array(%w(low medium high)).
      #         with_message('Severity must be low, medium, or high')
      #     end
      #
      # ### with_low_message
      #
      # Use `with_low_message` if you have a custom validation message for when
      # a given value is too low.
      #
      #     class Person
      #       include ActiveModel::Model
      #
      #       validate :age_must_be_valid
      #
      #       private
      #
      #       def age_must_be_valid
      #         if age < 65
      #           self.errors.add :age, 'You do not receive any benefits'
      #         end
      #       end
      #     end
      #
      #     # RSpec
      #     describe Person do
      #       it do
      #         should ensure_inclusion_of(:age).
      #           in_range(0..65).
      #           with_low_message('You do not receive any benefits')
      #       end
      #     end
      #
      #     # Test::Unit
      #     class PersonTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:age).
      #         in_range(0..65).
      #         with_low_message('You do not receive any benefits')
      #     end
      #
      # ### with_high_message
      #
      # Use `with_high_message` if you have a custom validation message for
      # when a given value is too high.
      #
      #     class Person
      #       include ActiveModel::Model
      #
      #       validate :age_must_be_valid
      #
      #       private
      #
      #       def age_must_be_valid
      #         if age > 21
      #           self.errors.add :age, "You're too old for this stuff"
      #         end
      #       end
      #     end
      #
      #     # RSpec
      #     describe Person do
      #       it do
      #         should ensure_inclusion_of(:age).
      #           in_range(0..21).
      #           with_high_message("You're too old for this stuff")
      #       end
      #     end
      #
      #     # Test::Unit
      #     class PersonTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:age).
      #         in_range(0..21).
      #         with_high_message("You're too old for this stuff")
      #     end
      #
      # ### allow_nil
      #
      # Use `allow_nil` to assert that the attribute allows nil.
      #
      #     class Issue
      #       include ActiveModel::Model
      #
      #       validates_presence_of :state
      #       validates_inclusion_of :state,
      #         in: %w(open resolved unresolved),
      #         allow_nil: true
      #     end
      #
      #     # RSpec
      #     describe Issue do
      #       it do
      #         should ensure_inclusion_of(:state).
      #           in_array(%w(open resolved unresolved)).
      #           allow_nil
      #       end
      #     end
      #
      #     # Test::Unit
      #     class IssueTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:state).
      #         in_array(%w(open resolved unresolved)).
      #         allow_nil
      #     end
      #
      # ### allow_blank
      #
      # Use `allow_blank` to assert that the attribute allows blank.
      #
      #     class Issue
      #       include ActiveModel::Model
      #
      #       validates_presence_of :state
      #       validates_inclusion_of :state,
      #         in: %w(open resolved unresolved),
      #         allow_blank: true
      #     end
      #
      #     # RSpec
      #     describe Issue do
      #       it do
      #         should ensure_inclusion_of(:state).
      #           in_array(%w(open resolved unresolved)).
      #           allow_blank
      #       end
      #     end
      #
      #     # Test::Unit
      #     class IssueTest < ActiveSupport::TestCase
      #       should ensure_inclusion_of(:state).
      #         in_array(%w(open resolved unresolved)).
      #         allow_blank
      #     end
      #
      # @return [EnsureInclusionOfMatcher]
      #
      def ensure_inclusion_of(attr)
        EnsureInclusionOfMatcher.new(attr)
      end

      # @private
      class EnsureInclusionOfMatcher < ValidationMatcher
        ARBITRARY_OUTSIDE_STRING = 'shouldamatchersteststring'
        ARBITRARY_OUTSIDE_FIXNUM = 123456789
        ARBITRARY_OUTSIDE_DECIMAL = 0.123456789

        def initialize(attribute)
          super(attribute)
          @options = {}
        end

        def in_array(array)
          @array = array
          self
        end

        def in_range(range)
          @range = range
          @minimum = range.first
          @maximum = range.max
          self
        end

        def allow_blank(allow_blank = true)
          @options[:allow_blank] = allow_blank
          self
        end

        def allow_nil(allow_nil = true)
          @options[:allow_nil] = allow_nil
          self
        end

        def with_message(message)
          if message
            @low_message = message
            @high_message = message
          end
          self
        end

        def with_low_message(message)
          @low_message = message if message
          self
        end

        def with_high_message(message)
          @high_message = message if message
          self
        end

        def description
          "ensure inclusion of #{@attribute} in #{inspect_message}"
        end

        def matches?(subject)
          super(subject)

          if @range
            @low_message  ||= :inclusion
            @high_message ||= :inclusion

            disallows_lower_value &&
              allows_minimum_value &&
              disallows_higher_value &&
              allows_maximum_value
          elsif @array
            if allows_all_values_in_array? && allows_blank_value? && allows_nil_value? && disallows_value_outside_of_array?
              true
            else
              @failure_message = "#{@array} doesn't match array in validation"
              false
            end
          end
        end

        private

        def allows_blank_value?
          if @options.key?(:allow_blank)
            blank_values = ['', ' ', "\n", "\r", "\t", "\f"]
            @options[:allow_blank] == blank_values.all? { |value| allows_value_of(value) }
          else
            true
          end
        end

        def allows_nil_value?
          if @options.key?(:allow_nil)
            @options[:allow_nil] == allows_value_of(nil)
          else
            true
          end
        end

        def inspect_message
          @range.nil? ? @array.inspect : @range.inspect
        end

        def allows_all_values_in_array?
          @array.all? do |value|
            allows_value_of(value, @low_message)
          end
        end

        def disallows_lower_value
          @minimum == 0 || disallows_value_of(@minimum - 1, @low_message)
        end

        def disallows_higher_value
          disallows_value_of(@maximum + 1, @high_message)
        end

        def allows_minimum_value
          allows_value_of(@minimum, @low_message)
        end

        def allows_maximum_value
          allows_value_of(@maximum, @high_message)
        end

        def disallows_value_outside_of_array?
          disallows_value_of(value_outside_of_array)
        end

        def value_outside_of_array
          if @array.include?(outside_value)
            raise CouldNotDetermineValueOutsideOfArray
          else
            outside_value
          end
        end

        def outside_value
          @outside_value ||= find_outside_value
        end

        def find_outside_value
          case @subject.send(@attribute.to_s)
          when Fixnum
            ARBITRARY_OUTSIDE_FIXNUM
          when BigDecimal
            ARBITRARY_OUTSIDE_DECIMAL 
          else
            ARBITRARY_OUTSIDE_STRING
          end
        end
      end
    end
  end
end
