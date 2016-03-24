class HraPlanTextSerializer(object):
    @staticmethod
    def serialize(hra_plan, f):
        f.write('id: {}, name: \'{}\'\n\n'.format(hra_plan.id, hra_plan.name))
