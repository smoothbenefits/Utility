import logging
Logger = logging.getLogger("import_excel")


class DirectDepositAccountsSerializer(object):
    @staticmethod
    def get_account_type(account_type):
        if account_type == 'S':
            return 'Saving'
        else:
            return 'Checking'

    @staticmethod
    def write_account(file, amount, percentage, routing_number, account_number, bank_name, account_type, user_id_string, id, user_account_id):
        bank_account_id = 'bank_account_id_{}_{}'.format(id, user_account_id)
        file.write('DECLARE\n')
        file.write('  {} int;\n'.format(bank_account_id))
        file.write('BEGIN\n')
        file.write('  INSERT INTO app_userbankaccount(routing, account, account_type, bank_name, user_id)\n')
        file.write('  VALUES(\'{}\', \'{}\', \'{}\', \'{}\', {})\n'.format(routing_number, account_number, DirectDepositAccountsSerializer.get_account_type(account_type), bank_name, user_id_string))
        file.write('  RETURNING id into {};\n'.format(bank_account_id))

        file.write('  INSERT INTO app_directdeposit(amount, percentage, remainder_of_all, bank_account_id, user_id)\n')
        file.write('  VALUES({}, {}, \'f\', {}, {});\n'.format(amount or 0, percentage or 0, bank_account_id, user_id_string))
        file.write('END;')
        file.write('\n')

    @staticmethod
    def escape_single_quote(name):
        return name.replace('\'', '\'\'')

    @staticmethod
    def serialize(accounts, file, user_id_string, id):
        account_count = 1
        if accounts and accounts.account_1_account_number:
            DirectDepositAccountsSerializer.write_account(
                file,
                accounts.account_1_amount,
                accounts.account_1_percentage,
                accounts.account_1_routing_number,
                accounts.account_1_account_number,
                DirectDepositAccountsSerializer.escape_single_quote(accounts.account_1_bank_name),
                accounts.account_1_account_type,
                user_id_string,
                id,
                account_count
            )
            account_count += 1

        if accounts and accounts.account_2_account_number:
            DirectDepositAccountsSerializer.write_account(
                file,
                accounts.account_2_amount,
                accounts.account_2_percentage,
                accounts.account_2_routing_number,
                accounts.account_2_account_number,
                DirectDepositAccountsSerializer.escape_single_quote(accounts.account_2_bank_name),
                accounts.account_2_account_type,
                user_id_string,
                id,
                account_count
            )
            account_count += 1

        if accounts and accounts.account_3_account_number:
            DirectDepositAccountsSerializer.write_account(
                file,
                accounts.account_3_amount,
                accounts.account_3_percentage,
                accounts.account_3_routing_number,
                accounts.account_3_account_number,
                DirectDepositAccountsSerializer.escape_single_quote(accounts.account_3_bank_name),
                accounts.account_3_account_type,
                user_id_string,
                id,
                account_count
            )        
        
