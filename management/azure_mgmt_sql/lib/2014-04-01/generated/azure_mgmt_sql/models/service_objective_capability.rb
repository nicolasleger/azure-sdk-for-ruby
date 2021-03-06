# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::SQL::Mgmt::V2014_04_01
  module Models
    #
    # The service objectives capability.
    #
    class ServiceObjectiveCapability

      include MsRestAzure

      # @return [String] The service objective name.
      attr_accessor :name

      # @return [CapabilityStatus] The status of the service objective.
      # Possible values include: 'Visible', 'Available', 'Default', 'Disabled'
      attr_accessor :status

      # @return [PerformanceLevelUnit] Unit type used to measure service
      # objective performance level. Possible values include: 'DTU'
      attr_accessor :unit

      # @return [Integer] Performance level value.
      attr_accessor :value

      # @return The unique ID of the service objective.
      attr_accessor :id

      # @return [Array<MaxSizeCapability>] The list of supported maximum
      # database sizes for this service objective.
      attr_accessor :supported_max_sizes

      # @return [MaxSizeCapability] The included (free) max size for this
      # service level objective.
      attr_accessor :included_max_size


      #
      # Mapper for ServiceObjectiveCapability class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ServiceObjectiveCapability',
          type: {
            name: 'Composite',
            class_name: 'ServiceObjectiveCapability',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              status: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'status',
                type: {
                  name: 'Enum',
                  module: 'CapabilityStatus'
                }
              },
              unit: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'performanceLevel.unit',
                type: {
                  name: 'Enum',
                  module: 'PerformanceLevelUnit'
                }
              },
              value: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'performanceLevel.value',
                type: {
                  name: 'Number'
                }
              },
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              supported_max_sizes: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'supportedMaxSizes',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'MaxSizeCapabilityElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'MaxSizeCapability'
                      }
                  }
                }
              },
              included_max_size: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'includedMaxSize',
                type: {
                  name: 'Composite',
                  class_name: 'MaxSizeCapability'
                }
              }
            }
          }
        }
      end
    end
  end
end
