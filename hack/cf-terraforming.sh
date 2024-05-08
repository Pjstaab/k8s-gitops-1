#!/bin/bash

# Note: Requires setting the environment varibale CLOUDFLARE_API_TOKEN with the appropriate cloudflare scoped permissions

# List of Terraform resources to iterate through
# https://registry.terraform.io/providers/cloudflare/cloudflare/4.0.0/docs
RESOURCE_LIST="cloudflare_access_application
cloudflare_access_group
cloudflare_access_mutual_tls_certificate
cloudflare_access_service_token
cloudflare_api_shield
cloudflare_argo
cloudflare_byo_ip_prefix
cloudflare_certificate_pack
cloudflare_custom_hostname
cloudflare_custom_hostname_fallback_origin
cloudflare_custom_pages
cloudflare_custom_ssl
cloudflare_filter
cloudflare_firewall_rule
cloudflare_load_balancer
cloudflare_load_balancer_monitor
cloudflare_load_balancer_pool
cloudflare_logpush_job
cloudflare_managed_headers
cloudflare_origin_ca_certificate
cloudflare_page_rule
cloudflare_rate_limit
cloudflare_record
cloudflare_ruleset
cloudflare_spectrum_application
cloudflare_tunnel
cloudflare_url_normalization_settings
cloudflare_waiting_room
cloudflare_worker_route
cloudflare_workers_kv_namespace
cloudflare_zone
cloudflare_zone_settings_override"

# Iterate through the list of IPs and run the command
for RESOURCE in $RESOURCE_LIST; do
  echo "Running command on resource: $RESOURCE"
  cf-terraforming import --resource-type=$RESOURCE --zone=$CLOUDFLARE_ZONE_ID
done