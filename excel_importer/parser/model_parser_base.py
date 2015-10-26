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
    def initialize_column_mapping(self, header_row):
        self._setup_column_mapping()
        for cell in header_row:
            if cell.value in self.column_property_mapping:
                self.column_index_property_mapping[cell.column] \
                    = self.column_property_mapping[cell.value]

    # Parse a data row into an instance of the corresponding model object
    def parse_data_row(self, data_row):
        model_instance = self._create_model_instance()

        for cell in data_row:
            if cell.column in self.column_index_property_mapping:
                self.column_index_property_mapping[cell.column](cell.value, model_instance)

        # Execute the post processing step
        model_instance = self._parse_data_row_post_process(model_instance, data_row)

        return model_instance

    # Polymorphic post processing step of parsing data row
    def _parse_data_row_post_process(self, model, data_row):
        return model

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _create_model_instance(self):
        raise NotImplementedError("Please Implement this method in the sub-class")
