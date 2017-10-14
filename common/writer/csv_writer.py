import csv 


class CSVWriter(object):

    def __init__(self):
        self._rows = []
        self._rows.append([])

    def save(self, output_file_path):
        with open(output_file_path, 'wb') as csvfile:
            writer = csv.writer(csvfile)

            for row in self._rows:
                writer.writerow(row)

    def write_cell(self, value):
        self._rows[-1].append(value)

    def skip_cells(self, num_cells):
        for i in range(num_cells):
            self._write_cell('')

    def next_row(self):
        self._rows.append([])
