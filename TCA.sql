Owner table name hz_parties:
SELECT  acv.first_name,acv.email_address,acv.contact_number,acv.party_relationship_id,acv.rel_party_id,
       acv.contact_id,acv.contact_party_id,hcp.contact_point_id,hcp.owner_table_name,hp.party_number,hp.party_type,hcp.owner_table_id hp.party_id,hrs.relationship_code,hrs.relationship_type,hps.party_site_id,hps.party_site_number
FROM ar_contacts_v acv,hz_contact_points hcp,
    hz_parties hp,hz_cust_accounts hca,
    hz_relationships hrs,hz_party_sites hps,
    hz_cust_acct_sites_all hcas,hz_locations hl
WHERE acv.contact_point_id=hcp.contact_point_id
and  hp.party_id=hca.party_id
and hca.cust_account_id=acv.customer_id
and hrs.relationship_id=acv.party_relationship_id
and hrs.object_id=hp.party_id
and hcas.party_site_id=hps.party_site_id
and hca.cust_account_id=hcas.cust_account_id
and hps.location_id = hl.location_id
and hca.account_number=&account_number;

owner table name-hz_party_sites:
SELECT  hp.party_name,hp.party_id,hp.party_type,hp.party_number,  hcp.phone_country_code,hcp.phone_area_code,hcp.phone_number,
         hcas.org_id,
         hcas.party_site_id,
         hca.cust_account_id,
         hcas.cust_acct_site_id,
         hcp.CONTACT_POINT_ID,
         hcp.CONTACT_POINT_TYPE,
         hcp.PHONE_LINE_TYPE,
         hcp.EMAIL_ADDRESS,
         hcp.owner_table_name,
         hl.location_id,hl.address1,hl.country,hl.city,hl.postal_code,hcp.owner_table_name
  FROM   hz_parties hp,
         hz_party_sites hps,
         hz_cust_accounts hca,
         hz_cust_acct_sites_all hcas,
         hz_contact_points hcp,
         hz_locations hl
        
 WHERE       hp.party_id = hps.party_id
         AND hca.party_id = hp.party_id
         AND hp.party_type IN ('ORGANIZATION', 'PERSON')
         AND hcas.party_site_id = hps.party_site_id
         AND hca.cust_account_id = hcas.cust_account_id
         AND hcp.contact_point_type in('PHONE','EMAIL')
         AND hps.party_site_id = hcp.owner_table_id
         AND hps.location_id          = hl.location_id

         AND hca.account_number=&account_number;
