from person_serializer import PersonSerializer

class UserSerializer(object):
    @staticmethod
    def serialize(user, f):
        if not f:
            return
        f.write("---------------------------------------------------------------------\n")
        f.write("user: {}, {}, {}, {}\n".format(user.id, user.first_name, user.last_name, user.email))
        PersonSerializer.serialize(user.person, f)
        if user.direct_deposits:
            f.write("\nDirect Deposits: \n")
            f.write("\tAccount 1: \n")
            f.write("\t\tAmount: {}\n".format(user.direct_deposits.account_1_amount))
            f.write("\t\tPercentage: {}\n".format(user.direct_deposits.account_1_percentage))
            f.write("\t\tRouting Number: {}\n".format(user.direct_deposits.account_1_routing_number))
            f.write("\t\tAccount Number: {}\n".format(user.direct_deposits.account_1_account_number))
            f.write("\t\tBank Name: {}\n".format(user.direct_deposits.account_1_bank_name))
            f.write("\t\tAccount Type: {}\n".format(user.direct_deposits.account_1_account_type))
            f.write("\tAccount 2: \n")
            f.write("\t\tAmount: {}\n".format(user.direct_deposits.account_2_amount))
            f.write("\t\tPercentage: {}\n".format(user.direct_deposits.account_2_percentage))
            f.write("\t\tRouting Number: {}\n".format(user.direct_deposits.account_2_routing_number))
            f.write("\t\tAccount Number: {}\n".format(user.direct_deposits.account_2_account_number))
            f.write("\t\tBank Name: {}\n".format(user.direct_deposits.account_2_bank_name))
            f.write("\t\tAccount Type: {}\n".format(user.direct_deposits.account_2_account_type))
            f.write("\tAccount 3: \n")
            f.write("\t\tAmount: {}\n".format(user.direct_deposits.account_3_amount))
            f.write("\t\tPercentage: {}\n".format(user.direct_deposits.account_3_percentage))
            f.write("\t\tRouting Number: {}\n".format(user.direct_deposits.account_3_routing_number))
            f.write("\t\tAccount Number: {}\n".format(user.direct_deposits.account_3_account_number))
            f.write("\t\tBank Name: {}\n".format(user.direct_deposits.account_3_bank_name))
            f.write("\t\tAccount Type: {}\n".format(user.direct_deposits.account_3_account_type))
        if user.w4:
            f.write("\nW4: \n")
            f.write("\tStatus: {}\n".format(user.w4.status))
            f.write("\tAllowance: {}\n".format(user.w4.allowance))
            f.write("\textra_amount: {}\n".format(user.w4.extra_amount))