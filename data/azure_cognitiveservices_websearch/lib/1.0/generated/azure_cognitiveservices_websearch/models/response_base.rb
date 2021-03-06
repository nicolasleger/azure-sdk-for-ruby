# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::CognitiveServices::WebSearch::V1_0
  module Models
    #
    # Model object.
    #
    #
    class ResponseBase

      include MsRestAzure

      @@discriminatorMap = Hash.new
      @@discriminatorMap["ImageObject"] = "ImageObject"
      @@discriminatorMap["WebPage"] = "WebPage"
      @@discriminatorMap["Web/WebAnswer"] = "WebWebAnswer"
      @@discriminatorMap["Images"] = "Images"
      @@discriminatorMap["NewsArticle"] = "NewsArticle"
      @@discriminatorMap["News"] = "News"
      @@discriminatorMap["RelatedSearches/RelatedSearchAnswer"] = "RelatedSearchesRelatedSearchAnswer"
      @@discriminatorMap["SpellSuggestions"] = "SpellSuggestions"
      @@discriminatorMap["TimeZone"] = "TimeZone"
      @@discriminatorMap["VideoObject"] = "VideoObject"
      @@discriminatorMap["Videos"] = "Videos"
      @@discriminatorMap["Computation"] = "Computation"
      @@discriminatorMap["Identifiable"] = "Identifiable"
      @@discriminatorMap["SearchResponse"] = "SearchResponse"
      @@discriminatorMap["Response"] = "Response"
      @@discriminatorMap["Thing"] = "Thing"
      @@discriminatorMap["Places"] = "Places"
      @@discriminatorMap["SearchResultsAnswer"] = "SearchResultsAnswer"
      @@discriminatorMap["Answer"] = "Answer"
      @@discriminatorMap["ErrorResponse"] = "ErrorResponse"
      @@discriminatorMap["CreativeWork"] = "CreativeWork"
      @@discriminatorMap["Intangible"] = "Intangible"
      @@discriminatorMap["MediaObject"] = "MediaObject"
      @@discriminatorMap["Article"] = "Article"
      @@discriminatorMap["StructuredValue"] = "StructuredValue"

      def initialize
        @_type = "ResponseBase"
      end

      attr_accessor :_type


      #
      # Mapper for ResponseBase class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ResponseBase',
          type: {
            name: 'Composite',
            polymorphic_discriminator: '_type',
            uber_parent: 'ResponseBase',
            class_name: 'ResponseBase',
            model_properties: {
            }
          }
        }
      end
    end
  end
end
