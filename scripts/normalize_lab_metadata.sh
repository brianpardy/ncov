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
s/Microbiology- Public Health/Microbiology - Public Health/g;
s/Centre for Infectious Diseases and Microbiology Public Health/Centre for Infectious Diseases and Microbiology - Public Health/g

# Belgium
s/KU Leuven, Clincal/KU Leuven, Clinical/g;

# Brazil
s/Instituto Adolfo Lutz Interdisciplinary Procedures Center Strategic Laboratory/Instituto Adolfo Lutz, Interdisciplinary Procedures Center, Strategic Laboratory/g;
s/Interdiciplinary/Interdisciplinary/g;
s/Bioinformatics Laboratory \/ LNCC/Bioinformatics Laboratory - LNCC/g;
s/Universidade Federal do Rio de Janeiro - UFRJ/Universidade Federal do Rio de Janeiro/g;

# England
s/The Florey Institute,  The Medical School/The Florey Institute, The Medical School/g;

# China
s/Insepction/Inspection/g;
s/China\./China/g;
s/the First Affiliated Hospital of Guangzhou/The First Affiliated Hospital of Guangzhou/g;
s/Guangdong Provincial Center for Diseases Control and Prevention/Guangdong Provincial Center for Disease Control and Prevention/g;
s/Inspection Center of Hanghzou/Inspection Center of Hangzhou/g;
s/National Institute for Viral Disease Control and Prevention, China CDC/National Institute for Viral Disease Control \& Prevention, China CDC/g;
s/National Institute for Viral Disease Control & Prevention, CCDC/National Institute for Viral Disease Control \& Prevention, China CDC/g;
s/Infectious Disease,Shenzhen Third/Infectious Disease, Shenzhen Third/g;
s/Provinical/Provincial/g;
s/Prevention;Guangdong/Prevention; Guangdong/g;
s/Guangdong Provincial Center for Disease Control and Prevention; Guangdong Provincial Public Health/Guangdong Provincial Center for Disease Control and Prevention; Guangdong Provincial Institute of Public Health/g;

# China/HK
s/University of Hon g Kong/University of Hong Kong/g;
s/Department of Clinical Pathology, Tuen Mun Hospital, 23 Tsing Chung Koon Road, Tuen Mun, N.T./Department of Clinical Pathology, Tuen Mun Hospital/g;

# Colombia
s/Instituto Nacional de Salud Universidad Cooperativa de Colombia Instituto Alexander von Humboldt Imperial College-London London School of Hygiene & Tropical Medicine/Instituto Nacional de Salud, Universidad Cooperativa de Colombia, Instituto Alexander von Humboldt, Imperial College-London, London School of Hygiene \& Tropical Medicine/g;

# France
s/Infectieux (IAI) Hospices/Infectieux (IAI), Hospices/g;

# Germany
s/Charite Universitaetsmedizin/Charite Universitatsmedizin/g;

# India
s/Indian Council of Medical Research - National Institute of Virology/Indian Council of Medical Research-National Institute of Virology/g;

# Italy
s/Istituto Superiore di Sanita, Roma , Italy/Istituto Superiore di Sanita, Rome, Italy/g;
s/International Center fro Genetic Engineering/International Center for Genetic Engineering/g;

# Japan
s/Dept. of Virology III, National Institute of Infectious Diseases/Department of Virology III, National Institute of Infectious Diseases/g;

# Luxembourg
s/Laboratoire Nationale de Sante/Laboratoire National de Sante/g;

# Peru
s/Laboratorio de Referencia Nacional de Virus Respiratorio. Instituto Nacional de Salud. Peru/Nacional de Virus Respiratorios. Instituto Nacional de Salud Peru/g;
s/Biologia Molecular.  Instituto Nacional de Salud Peru/Biologia Molecular, Instituto Nacional de Salud, Peru/g;
s/Biologia Molecular.Instituto Nacional de Salud.Peru/Biologia Molecular, Instituto Nacional de Salud, Peru/g;


# Senegal
s/Institut pasteur Dakar/Institut Pasteur Dakar/g;

# Spain
s/FUNDACION JIMENEZ DIAZ/Fundacion Jimenez Diaz/g;
s/FISABIO-Public Health\./FISABIO-Public Health/g;
s/HOSPITAL UNIVERSITARIO LA PAZ/Hospital Universitario La Paz/g;
s/HOSPITAL UNIVERSITARIO VIRGEN DE LAS NIEVES/Hospital Universitario Virgen de las Nieves/g;

# Taiwan
s/Taiwan\./Taiwan/g;

# US/VA
s/Division of Consolidated Laboratories Services/Division of Consolidated Laboratory Services/g;
s/Division of Consolidated Laboratories/Division of Consolidated Laboratory Services/g;

# US/WI
s/Wisconsin - Madison/Wisconsin-Madison/g;
s/University of Wisconsin Madison, AIDS Vaccine Research Laboratories/University of Wisconsin-Madison AIDS Vaccine Research Laboratories/g;
s/University of Wisconsin-Madison, AIDS Vaccine Research Laboratories/University of Wisconsin-Madison AIDS Vaccine Research Laboratories/g;
s/AIDS Vaccine Research Laboratory/AIDS Vaccine Research Laboratories/g;
s/\tAIDS Vaccine Research Laboratories\t/\tUniversity of Wisconsin-Madison AIDS Vaccine Research Laboratories\t/g;
s/Gundersen Molecular Diagnostic Laboratory/Gundersen Molecular Diagnostics Laboratory/g;

# Vietnam
s/National Influenza Center, National Institute of Hygiene/National Influenza Center - National Institute of Hygiene/g;


' $METADATA_IN > $METADATA_OUT

cp $METADATA_OUT $METADATA_IN
