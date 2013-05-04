# -*- encoding : utf-8 -*-

module Extras
  module SchoolTypes

    PROFESSIONAL_TYPES = {
      "integrated" => {
        title: "综合",
        code: "integrated",
        number: 580
      },
      "engineering" => {
        title: "工科",
        code: "engineering",
        number: 767
      },
      "teacher" => {
        title: "师范",
        code: "teacher",
        number: 219
      },
      "medicine" => {
        title: "医药",
        code: "medicine",
        number: 154
      },
      "agriculture" => {
        title: "农业",
        code: "agriculture",
        number: 87
      },
      "finance" => {
        title: "财经",
        code: "finance",
        number: 202
      },
      "politics" => {
        title: "政法",
        code: "politics",
        number: 70
      },
      "language" => {
        title: "语言",
        code: "language",
        number: 44
      },
      "forestry" => {
        title: "林业",
        code: "forestry",
        number: 18
      },
      "arts" => {
        title: "艺术",
        code: "arts",
        number: 76
      },
      "sports" => {
        title: "体育",
        code: "sports",
        number: 30
      },
      "ethnic" => {
        title: "民族",
        code: "ethnic",
        number: 18
      },
      "military" => {
        title: "军事",
        code: "military",
        number: 13
      }
    }

    def professional_type_choices
      sorted_types = PROFESSIONAL_TYPES.sort_by {|key, type| type[:number]}.reverse
      sorted_types.map {|type| [type[1][:title], type[1][:code]]}
    end

    def professional_type_name(code)
      if PROFESSIONAL_TYPES.has_key?(code)
        PROFESSIONAL_TYPES[code][:title]
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def professional_type_name(code)
        if PROFESSIONAL_TYPES.has_key?(code)
          PROFESSIONAL_TYPES[code][:title]
        end
      end

    end

  end
end