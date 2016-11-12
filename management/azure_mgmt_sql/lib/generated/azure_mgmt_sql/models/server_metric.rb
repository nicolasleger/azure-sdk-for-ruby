# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::SQL
  module Models
    #
    # Represents Azure SQL server metrics.
    #
    class ServerMetric

      include MsRestAzure

      # @return [String] The name of the resource.
      attr_accessor :resource_name

      # @return [String] The metric display name.
      attr_accessor :display_name

      # @return [Float] The current value of the metric.
      attr_accessor :current_value

      # @return [Float] The current limit of the metric.
      attr_accessor :limit

      # @return [String] The units of the metric.
      attr_accessor :unit

      # @return [DateTime] The next reset time for the metric (ISO8601 format).
      attr_accessor :next_reset_time


      #
      # Mapper for ServerMetric class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ServerMetric',
          type: {
            name: 'Composite',
            class_name: 'ServerMetric',
            model_properties: {
              resource_name: {
                required: false,
                read_only: true,
                serialized_name: 'resourceName',
                type: {
                  name: 'String'
                }
              },
              display_name: {
                required: false,
                read_only: true,
                serialized_name: 'displayName',
                type: {
                  name: 'String'
                }
              },
              current_value: {
                required: false,
                read_only: true,
                serialized_name: 'currentValue',
                type: {
                  name: 'Double'
                }
              },
              limit: {
                required: false,
                read_only: true,
                serialized_name: 'limit',
                type: {
                  name: 'Double'
                }
              },
              unit: {
                required: false,
                read_only: true,
                serialized_name: 'unit',
                type: {
                  name: 'String'
                }
              },
              next_reset_time: {
                required: false,
                read_only: true,
                serialized_name: 'nextResetTime',
                type: {
                  name: 'DateTime'
                }
              }
            }
          }
        }
      end
    end
  end
end
