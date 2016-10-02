class DataImportBase(object):

    # Get the name of the program, so the users can use it to run the logic
    def get_program_name(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    # Show usage/help messages
    def usage(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    # Execute the program/logic with the expected command line arguments 
    def execute(self, argv):
        raise NotImplementedError("Please Implement this method in the sub-class")
