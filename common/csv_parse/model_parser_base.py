from datetime import datetime


class ModelParserBase(object):
    def __init__(self):
        # Mapping from column index to property setter
        # The keys are column index
        # The values are function pointers to do the right
        # thing with the corresponding field value
        self.column_index_property_mapping = {}
        self._setup_column_index_mapping()

    # Parse a data row into an instance of the corresponding model object
    def parse_data_row(self, data_row):
        model_instance = self._create_model_instance()
        for index in self.column_index_property_mapping:
            self.column_index_property_mapping[index](data_row[index], model_instance)
        return model_instance

    def _set_string_value_on_model(self, model, field_name, value):
        result_value = value
        if (value is not None):
            result_value = value.strip()
        setattr(model, field_name, result_value)

    def _set_number_value_on_model(self, model, field_name, value):
        result_value = value
        if (value is not None):
            result_value = float(value)
        setattr(model, field_name, result_value)

    def _set_date_value_on_model(self, model, field_name, value):
        result_value = value
        if (value and \
                (type(value) is unicode or type(value) is str)
            ):
            result_value = datetime.strptime(value, '%m/%d/%Y')
        setattr(model, field_name, result_value)

    def _setattr_strip(self, obj, attr_key, value):
        if type(value) is unicode or type(value) is str:
            setattr(obj, attr_key, value.strip())
        else:
            setattr(obj, attr_key, value)

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_index_mapping(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _create_model_instance(self):
        raise NotImplementedError("Please Implement this method in the sub-class")
