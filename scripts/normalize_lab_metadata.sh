#!/bin/bash

METADATA_IN=$1

if [[ ! -r "$METADATA_IN" ]]
then
	echo "$0: input $METADATA_IN not found"
	exit 1
fi

cp $METADATA_IN ${METADATA_IN}.bak

METADATA_OUT=${METADATA_IN}.fixed

sed '
# Australia
##
# Centre for Infectious Diseases and Microbiology - Public Health (4)
# Centre for Infectious Diseases and Microbiology Public Health (30)
# Centre for Infectious Diseases and Microbiology- Public Health (1)
##
/^Australia/s/Microbiology- Public Health/Microbiology Public Health/;
/^Australia/s/Microbiology - Public Health/Microbiology Public Health/;


# Belgium
##
# KU Leuven, Clincal and Epidemiological Virology (1)
# KU Leuven, Clinical and Epidemiological Virology (42)
##
/^Belgium/s/KU Leuven, Clincal/KU Leuven, Clinical/;

#
## Brazil
#s/Instituto Adolfo Lutz Interdisciplinary Procedures Center Strategic Laboratory/Instituto Adolfo Lutz, Interdisciplinary Procedures Center, Strategic Laboratory/g;
#s/Interdiciplinary/Interdisciplinary/g;
#s/Bioinformatics Laboratory \/ LNCC/Bioinformatics Laboratory - LNCC/g;
#s/Universidade Federal do Rio de Janeiro - UFRJ/Universidade Federal do Rio de Janeiro/g;
#
## Canada
#s/Public Health Ontario Laboratories/Public Health Ontario Laboratory/g;
#
#
## China
#s/Insepction/Inspection/g;
#s/China\./China/g;
#s/the First Affiliated Hospital of Guangzhou/The First Affiliated Hospital of Guangzhou/g;
#s/Guangdong Provincial Center for Diseases Control and Prevention/Guangdong Provincial Center for Disease Control and Prevention/g;
#s/Inspection Center of Hanghzou/Inspection Center of Hangzhou/g;
#s/National Institute for Viral Disease Control and Prevention, China CDC/National Institute for Viral Disease Control \& Prevention, China CDC/g;
#s/National Institute for Viral Disease Control & Prevention, CCDC/National Institute for Viral Disease Control \& Prevention, China CDC/g;
#s/Infectious Disease,Shenzhen Third/Infectious Disease, Shenzhen Third/g;
#s/Provinical/Provincial/g;
#s/Prevention;Guangdong/Prevention; Guangdong/g;
#s/Guangdong Provincial Center for Disease Control and Prevention; Guangdong Provincial Public Health/Guangdong Provincial Center for Disease Control and Prevention; Guangdong Provincial Institute of Public Health/g;
#s/\tGuangdong Provincial Center for Disease Control and Prevention\t/\tGuangdong Provincial Center for Disease Control and Prevention; Guangdong Provincial Institute of Public Health\t/g
#s/\tGuangdong Provincial Institution of Public Health\t/\tGuangdong Provincial Center for Disease Control and Prevention; Guangdong Provincial Institute of Public Health\t/g;
#
## China/HK
#s/University of Hon g Kong/University of Hong Kong/g;
#s/Department of Clinical Pathology, Tuen Mun Hospital, 23 Tsing Chung Koon Road, Tuen Mun, N\.T\./Department of Clinical Pathology, Tuen Mun Hospital/g;
#s/The Chinese University of Hong Kong/Chinese University of Hong Kong/g;
#
## Colombia
#s/Instituto Nacional de Salud Universidad Cooperativa de Colombia Instituto Alexander von Humboldt Imperial College-London London School of Hygiene \& Tropical Medicine/Instituto Nacional de Salud, Universidad Cooperativa de Colombia, Instituto Alexander von Humboldt, Imperial College-London, London School of Hygiene \& Tropical Medicine/g;
#s/\tInstituto Nacional de Salud\t/\tInstituto Nacional de Salud, Universidad Cooperativa de Colombia, Instituto Alexander von Humboldt, Imperial College-London, London School of Hygiene \& Tropical Medicine\t/g;
#
## England
#s/The Florey Institute,  The Medical School/The Florey Institute, The Medical School/g;
#
## France
#s/Infectieux (IAI) Hospices/Infectieux (IAI), Hospices/g;
#
## Germany
#s/Charite Universitaetsmedizin/Charite Universitatsmedizin/g;
#
## Hungary
#s/Bioinformatics Research Group, Szentagothai Research Centre\t/Bioinformatics Research Group, Szentagothai Research Centre, University of Pecs\t/g;
#s/Virological Research Group, Szentagothai Research Centre\t/Virological Research Group, Szentagothai Research Centre, University of Pecs\t/g;
#
## India
#s/Indian Council of Medical Research - National Institute of Virology/Indian Council of Medical Research-National Institute of Virology/g;
#
## Italy
#s/Istituto Superiore di Sanita, Roma , Italy/Istituto Superiore di Sanita, Rome, Italy/g;
#s/International Center fro Genetic Engineering/International Center for Genetic Engineering/g;
#s/"Istituto/Istituto/g;
#s/"""/"/g;
#s/""/"/g;
#s/G\.Caporale/G. Caporale/g;
#s/Abruzzo e Molise/Abruzzo e del Molise/g;
#
## Japan
#s/Dept\. of Virology III, National Institute of Infectious Diseases/Department of Virology III, National Institute of Infectious Diseases/g;
#
## Luxembourg
#s/Laboratoire Nationale de Sante/Laboratoire National de Sante/g;
#
## Peru
#s/Laboratorio de Referencia Nacional de Virus Respiratorio\. Instituto Nacional de Salud\. Peru/Nacional de Virus Respiratorios\. Instituto Nacional de Salud Peru/g;
#s/Biologia Molecular\.  Instituto Nacional de Salud Peru/Biologia Molecular, Instituto Nacional de Salud, Peru/g;
#s/Biologia Molecular\.Instituto Nacional de Salud\.Peru/Biologia Molecular, Instituto Nacional de Salud, Peru/g;
#
#
## Senegal
#s/Institut pasteur Dakar/Institut Pasteur Dakar/g;
#
## Spain
#s/FUNDACION JIMENEZ DIAZ/Fundacion Jimenez Diaz/g;
#s/FISABIO-Public Health\./FISABIO-Public Health/g;
#s/HOSPITAL UNIVERSITARIO LA PAZ/Hospital Universitario La Paz/g;
#s/HOSPITAL UNIVERSITARIO VIRGEN DE LAS NIEVES/Hospital Universitario Virgen de las Nieves/g;
#s/Servicio Microbiologia\. Hospital Clinico Universitario\. Valencia/Servicio Microbiologia, Hospital Clinico Universitario, Valencia/g;
#s/Servicio de Microbiologia\. Hospital Clinico Universitario de Valencia/Servicio Microbiologia, Hospital Clinico Universitario, Valencia/g;
#s/Servicio Microbiologia, Hospital Clinico Universitario, Valencia\./Servicio Microbiologia, Hospital Clinico Universitario, Valencia/g;
#
## Taiwan
#s/Taiwan\./Taiwan/g;
#
## US/VA
#s/Division of Consolidated Laboratories Services/Division of Consolidated Laboratory Services/g;
#s/Division of Consolidated Laboratories/Division of Consolidated Laboratory Services/g;
#
## US/WI
#s/Wisconsin - Madison/Wisconsin-Madison/g;
#s/University of Wisconsin Madison, AIDS Vaccine Research Laboratories/University of Wisconsin-Madison AIDS Vaccine Research Laboratories/g;
#s/University of Wisconsin-Madison, AIDS Vaccine Research Laboratories/University of Wisconsin-Madison AIDS Vaccine Research Laboratories/g;
#s/AIDS Vaccine Research Laboratory/AIDS Vaccine Research Laboratories/g;
#s/\tAIDS Vaccine Research Laboratories\t/\tUniversity of Wisconsin-Madison AIDS Vaccine Research Laboratories\t/g;
#s/Gundersen Molecular Diagnostic Laboratory/Gundersen Molecular Diagnostics Laboratory/g;
#
## Vietnam
#s/National Influenza Center, National Institute of Hygiene/National Influenza Center - National Institute of Hygiene/g;
#

' $METADATA_IN > $METADATA_OUT

cp $METADATA_OUT $METADATA_IN
