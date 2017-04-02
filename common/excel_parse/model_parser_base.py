class ModelParserBase(object):
    def __init__(self):
        # Mapping from column header to property setter
        # The keys are column header texts
        # The values are function pointers to do the right
        # thing with the corresponding field value
        self.column_property_mapping = {}

        # Mapping from column index to property setter
        # The keys are column index
        # The values are function pointers to do the right
        # thing with the corresponding field value
        self.column_index_property_mapping = {}

    # Initialize the internal column mapping from the given header row
    def __initialize_column_mapping(self, header_row):
        self._setup_column_mapping()
        for cell in header_row:
            if cell.value and cell.value.lower() in self.column_property_mapping:
                self.column_index_property_mapping[cell.column] \
                    = self.column_property_mapping[cell.value.lower()]

    def initialize(self, header_row):
        self.__initialize_column_mapping(header_row)

    # Parse a data row into an instance of the corresponding model object
    def parse_data_row(self, data_row):
        # This is a werid way to workaround an issue in the library
        # where it returns None for the row number if a cell is empty..
        # so here we do a iteration over the cell first to find the 
        # row number.
        row_number = None
        for cell in data_row:
            if cell.row:
                row_number = cell.row
                break
        model_instance = self._create_model_instance(row_number)
        for cell in data_row:
            if cell.column in self.column_index_property_mapping:
                self.column_index_property_mapping[cell.column](cell.value, model_instance)
        return model_instance

    def _set_string_value_on_model(self, model, field_name, value):
        result_value = value
        if (result_value is not None):
            if type(result_value) is unicode or type(result_value) is str:
                result_value = result_value.strip()
            else:
                result_value = '{0:g}'.format(result_value).strip()
        setattr(model, field_name, result_value)

    def _set_number_value_on_model(self, model, field_name, value):
        result_value = value
        if (value is not None):
            result_value = float(value)
        setattr(model, field_name, result_value)

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _create_model_instance(self, row_number):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _setattr_strip(self, obj, attr_key, value):
        if type(value) is unicode or type(value) is str:
            setattr(obj, attr_key, value.strip())
        else:
            setattr(obj, attr_key, value)
