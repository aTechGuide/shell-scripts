#!/bin/bash

# Ref https://vercel.com/guides/why-is-my-vercel-domain-unverified#a-record-changes

# Prompt the user for the domain name
read -p "Enter the domain name: " domain

echo "####### Checking NameServer Changes for $domain #######"
echo

echo "Querying Google DNS"
dig @8.8.8.8 +short NS $domain
echo

echo "Querying Cloudflare DNS"
dig @1.1.1.1 +short NS $domain
echo

echo "Querying Vercel DNS"
dig @ns1.vercel-dns.com +short NS $domain
echo

echo "####### Checking A Record Changes for $domain #######"
echo

echo "Querying Google DNS"
dig @8.8.8.8 +short A $domain
echo

echo "Querying Cloudflare DNS"
dig @1.1.1.1 +short A $domain
echo


echo "Querying Vercel DNS"
dig @ns1.vercel-dns.com +short A $domain
echo

echo
echo
echo "####### Checking CNAME Record Changes for $domain #######"
echo
echo "Querying Google DNS"
dig @8.8.8.8 +short CNAME www.$domain
echo


echo "Querying Cloudflare DNS"
dig @1.1.1.1 +short CNAME www.$domain
echo


echo "Querying Vercel DNS"
dig @ns1.vercel-dns.com +short CNAME www.$domain
echo






## Check the DNS records for the domain
#echo "Checking DNS records for $domain..."
#dig +nocmd $domain any +multiline +noall +answer
#
## Check the TXT record for the domain
#echo "Checking TXT record for $domain..."
#dig +nocmd _vercel-dns.$domain TXT +multiline +noall +answer
#
## Check the CNAME record for the domain
#echo "Checking CNAME record for $domain..."
#dig +nocmd $domain CNAME +multiline +noall +answer
#
## Check the A record for the domain
#echo "Checking A record for $domain..."
#dig +nocmd $domain A +multiline +noall +answer
#
## Check the AAAA record for the domain
#echo "Checking AAAA record for $domain..."
#dig +nocmd $domain AAAA +multiline +noall +answer