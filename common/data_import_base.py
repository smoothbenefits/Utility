import sys


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

    def _confirm_question(self, question):
        prompt = ' [yes/no] '

        yes = set(['yes'])
        no = set(['no'])

        while True:
            sys.stdout.write(question + prompt)
            choice = raw_input().lower()
            if choice in yes:
               return True
            elif choice in no:
               return False
            else:
               sys.stdout.write("Please respond with 'yes' or 'no'\n")
