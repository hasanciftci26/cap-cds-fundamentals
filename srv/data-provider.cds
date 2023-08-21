using {
    Personnels           as DBPersonnels,
    IdentityInformations as DBIdentityInformations,
    Cars                 as DBCars,
    Expenses             as DBExpenses
} from '../db/data-models';

service PersonnelManagement {

    @restrict: [
        {
            grant: 'READ',
            to   : 'Manager'
        },
        {
            grant: 'READ',
            to   : 'User',
            where: 'email = $user.id'
        }
    ]
    entity Personnels           as select from DBPersonnels;

    entity IdentityInformations as select from DBIdentityInformations;
    entity Cars                 as select from DBCars;
    entity Expenses             as select from DBExpenses;
};
