CLASS zbo_business_object_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES t_bor_name TYPE swo_objtyp.
    TYPES t_message_application TYPE nast-kappl.

    CONSTANTS:
      BEGIN OF c_bor_names,
        sales_order TYPE t_bor_name VALUE 'PR_SLSORD',
      END OF c_bor_names .

    CONSTANTS:
      BEGIN OF c_message_applications,
        sales_order TYPE t_bor_name VALUE 'V1',
      END OF c_message_applications.

    CLASS-METHODS get_factory
      RETURNING
        VALUE(factory) TYPE REF TO zbo_business_object_factory .

    METHODS get_business_object_by_bor
      IMPORTING
        !bo_name               TYPE t_bor_name
        !bo_key                TYPE zbo_business_object_i=>t_bo_key
      RETURNING
        VALUE(business_object) TYPE REF TO zbo_business_object_i .

    METHODS get_business_object_by_appl
      IMPORTING
        !message_application   TYPE nast-kappl
        !message_object_key    TYPE nast-objky
      RETURNING
        VALUE(business_object) TYPE REF TO zbo_business_object_i .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS ZBO_BUSINESS_OBJECT_FACTORY IMPLEMENTATION.

  METHOD get_business_object_by_bor.

    CASE bo_name.

      WHEN c_bor_names-sales_order.

        business_object = CAST zbo_business_object_i(
          zsd_sales_order_bo_ft=>get_factory( )->get_sales_order_bo(
            CONV #( bo_key ) ) ).

      WHEN OTHERS.

        ASSERT 1 = 0.

    ENDCASE.

  ENDMETHOD.


  METHOD get_business_object_by_appl.

    CASE message_application.

      WHEN c_message_applications-sales_order.

        business_object = CAST zbo_business_object_i(
          zsd_sales_order_bo_ft=>get_factory( )->get_sales_order_bo(
            CONV #( message_object_key ) ) ).

      WHEN OTHERS.

        ASSERT 1 = 0.

    ENDCASE.

  ENDMETHOD.


  METHOD get_factory.

    factory = NEW #( ).

  ENDMETHOD.
ENDCLASS.
