# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Graph::Mgmt::V1_6
  module Models
    #
    # Request parameters for adding a member to a group.
    #
    class GroupAddMemberParameters

      include MsRestAzure

      # @return [String] A member object URL, such as
      # "https://graph.windows.net/0b1f9851-1bf0-433f-aec3-cb9272f093dc/directoryObjects/f260bbc4-c254-447b-94cf-293b5ec434dd",
      # where "0b1f9851-1bf0-433f-aec3-cb9272f093dc" is the tenantId and
      # "f260bbc4-c254-447b-94cf-293b5ec434dd" is the objectId of the member
      # (user, application, servicePrincipal, group) to be added.
      attr_accessor :url


      #
      # Mapper for GroupAddMemberParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'GroupAddMemberParameters',
          type: {
            name: 'Composite',
            class_name: 'GroupAddMemberParameters',
            model_properties: {
              url: {
                client_side_validation: true,
                required: true,
                serialized_name: 'url',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
