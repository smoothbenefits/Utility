from common.model.excel_row_model_base import ExcelRowModelBase


class BlankUserAdjustmentSpec(object):

    def __init__(self):
        pass

    def __is_user_info_valid(self):
        return True

    def is_valid_for_complete_info(self):
        return True

    def should_auto_populate_hours(self):
        return False

    def should_deduct_lunch_hours(self):
        return True
