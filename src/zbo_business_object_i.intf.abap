interface ZBO_BUSINESS_OBJECT_I
  public .


  types T_BO_KEY type STRING .

  methods GET_BO_KEY
    returning
      value(BO_KEY) type T_BO_KEY .
endinterface.
