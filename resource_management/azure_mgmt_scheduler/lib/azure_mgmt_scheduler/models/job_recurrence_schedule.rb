# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Scheduler
  module Models
    #
    # Model object.
    #
    class JobRecurrenceSchedule

      include MsRestAzure

      # @return [Array<DayOfWeek>] Gets or sets the days of the week that the
      # job should execute on.
      attr_accessor :week_days

      # @return [Array<Integer>] Gets or sets the hours of the day that the
      # job should execute at.
      attr_accessor :hours

      # @return [Array<Integer>] Gets or sets the minutes of the hour that the
      # job should execute at.
      attr_accessor :minutes

      # @return [Array<Integer>] Gets or sets the days of the month that the
      # job should execute on. Must be between 1 and 31.
      attr_accessor :month_days

      # @return [Array<JobRecurrenceScheduleMonthlyOccurrence>] Gets or sets
      # the occurrences of days within a month.
      attr_accessor :monthly_occurrences

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @week_days.each{ |e| e.validate if e.respond_to?(:validate) } unless @week_days.nil?
        @hours.each{ |e| e.validate if e.respond_to?(:validate) } unless @hours.nil?
        @minutes.each{ |e| e.validate if e.respond_to?(:validate) } unless @minutes.nil?
        @month_days.each{ |e| e.validate if e.respond_to?(:validate) } unless @month_days.nil?
        @monthly_occurrences.each{ |e| e.validate if e.respond_to?(:validate) } unless @monthly_occurrences.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.week_days
        output_object['weekDays'] = serialized_property unless serialized_property.nil?

        serialized_property = object.hours
        output_object['hours'] = serialized_property unless serialized_property.nil?

        serialized_property = object.minutes
        output_object['minutes'] = serialized_property unless serialized_property.nil?

        serialized_property = object.month_days
        output_object['monthDays'] = serialized_property unless serialized_property.nil?

        serialized_property = object.monthly_occurrences
        unless serialized_property.nil?
          serializedArray = []
          serialized_property.each do |element4|
            unless element4.nil?
              element4 = JobRecurrenceScheduleMonthlyOccurrence.serialize_object(element4)
            end
            serializedArray.push(element4)
          end
          serialized_property = serializedArray
        end
        output_object['monthlyOccurrences'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [JobRecurrenceSchedule] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = JobRecurrenceSchedule.new

        deserialized_property = object['weekDays']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element5|
            if (!element5.nil? && !element5.empty?)
              enum_is_valid = DayOfWeek.constants.any? { |e| DayOfWeek.const_get(e).to_s.downcase == element5.downcase }
              warn 'Enum DayOfWeek does not contain ' + element5.downcase + ', but was received from the server.' unless enum_is_valid
            end
            deserialized_array.push(element5)
          end
          deserialized_property = deserialized_array
        end
        output_object.week_days = deserialized_property

        deserialized_property = object['hours']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element6|
            element6 = Integer(element6) unless element6.to_s.empty?
            deserialized_array.push(element6)
          end
          deserialized_property = deserialized_array
        end
        output_object.hours = deserialized_property

        deserialized_property = object['minutes']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element7|
            element7 = Integer(element7) unless element7.to_s.empty?
            deserialized_array.push(element7)
          end
          deserialized_property = deserialized_array
        end
        output_object.minutes = deserialized_property

        deserialized_property = object['monthDays']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element8|
            element8 = Integer(element8) unless element8.to_s.empty?
            deserialized_array.push(element8)
          end
          deserialized_property = deserialized_array
        end
        output_object.month_days = deserialized_property

        deserialized_property = object['monthlyOccurrences']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element9|
            unless element9.nil?
              element9 = JobRecurrenceScheduleMonthlyOccurrence.deserialize_object(element9)
            end
            deserialized_array.push(element9)
          end
          deserialized_property = deserialized_array
        end
        output_object.monthly_occurrences = deserialized_property

        output_object
      end
    end
  end
end