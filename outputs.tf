output "instance_ocid" {
  value = oci_core_instance.instance.id
}

output "instamce_console_ocid" {
  value = oci_core_instance_console_connection.console.id
}