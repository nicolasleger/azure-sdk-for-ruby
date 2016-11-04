# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Logic
  module Models
    #
    # Model object.
    #
    class IntegrationAccountSchema < MsRestAzure::IntegrationAccountResource

      include MsRestAzure

      # @return [SchemaType] The schema type. Possible values include:
      # 'NotSpecified', 'Xml'
      attr_accessor :schema_type

      # @return [String] The target namespace.
      attr_accessor :target_namespace

      # @return [DateTime] The created time.
      attr_accessor :created_time

      # @return [DateTime] The changed time.
      attr_accessor :changed_time

      # @return The content.
      attr_accessor :content

      # @return [String] The content type.
      attr_accessor :content_type

      # @return [IntegrationAccountContentLink] The content link.
      attr_accessor :content_link

      # @return The metadata.
      attr_accessor :metadata


      #
      # Mapper for IntegrationAccountSchema class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'IntegrationAccountSchema',
          type: {
            name: 'Composite',
            class_name: 'IntegrationAccountSchema',
            model_properties: {
              id: {
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                required: false,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              schema_type: {
                required: false,
                serialized_name: 'properties.schemaType',
                type: {
                  name: 'Enum',
                  module: 'SchemaType'
                }
              },
              target_namespace: {
                required: false,
                serialized_name: 'properties.targetNamespace',
                type: {
                  name: 'String'
                }
              },
              created_time: {
                required: false,
                read_only: true,
                serialized_name: 'properties.createdTime',
                type: {
                  name: 'DateTime'
                }
              },
              changed_time: {
                required: false,
                read_only: true,
                serialized_name: 'properties.changedTime',
                type: {
                  name: 'DateTime'
                }
              },
              content: {
                required: false,
                serialized_name: 'properties.content',
                type: {
                  name: 'Object'
                }
              },
              content_type: {
                required: false,
                serialized_name: 'properties.contentType',
                type: {
                  name: 'String'
                }
              },
              content_link: {
                required: false,
                read_only: true,
                serialized_name: 'properties.contentLink',
                type: {
                  name: 'Composite',
                  class_name: 'IntegrationAccountContentLink'
                }
              },
              metadata: {
                required: false,
                serialized_name: 'properties.metadata',
                type: {
                  name: 'Object'
                }
              }
            }
          }
        }
      end
    end
  end
end
