class SQLWriter(object):

    def __init__(self, output_file_path):
        self._file_path = output_file_path
        self._file = None 

    def __enter__(self):
        self._file = open(self._file_path, 'w')
        self._file.truncate()
        self._file.write('BEGIN;\n')
        self._file.write('\n')
        self._file.write('DO $$\n')
        self._file.write('BEGIN\n')
        self._file.write('\n')
        return self

    def __exit__(self, type, value, traceback):
        self._file.write('\n')
        self._file.write('END\n')
        self._file.write('$$;\n')
        self._file.write('\n')
        self._file.write('-- COMMIT;\n')
        self._file.write('-- ROLLBACK;\n')
        self._file.close()

    def write_line(self, line):
        if (not self._file):
            raise RuntimeError('Writer is not initialized. Please ensure to use the "with" statement.')
        self._file.write('{}\n'.format(line))
