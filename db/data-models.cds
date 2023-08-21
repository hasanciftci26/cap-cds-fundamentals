entity Personnels {
    key ID                    : Integer;
        email                 : String(255);
        firstName             : String(40);
        tcNo                  : IdentityInformations:tcNo;
        toIdentityInformation : Association to IdentityInformations
                                    on toIdentityInformation.tcNo = $self.tcNo;
        toCars                : Association to many Cars
                                    on toCars.toPersonnel = $self;
        toExpenses            : Composition of many Expenses
                                    on toExpenses.toPersonnel = $self;
};

entity IdentityInformations {
    key tcNo       : Integer;
        birthPlace : String(40);
};

entity Cars {
    key ID          : Integer;
        personnelID : Personnels:ID;
        toPersonnel : Association to Personnels
                          on toPersonnel.ID = $self.personnelID;
};

@cds.autoexpose
@assert.integrity
entity Expenses {
    key ID          : UUID;
        text        : String(10);
        toPersonnel : Association to Personnels;
};
