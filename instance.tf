data "oci_core_images" "image" {
  compartment_id = var.compartment_ocid

  display_name = var.image_name
}

data "oci_core_subnet" "primary" {
    subnet_id = var.subnet_ocid
}

resource "oci_core_instance" "instance" {
  display_name = var.name

  compartment_id = var.compartment_ocid
  availability_domain = var.availability_domain_ocid

  shape = var.shape
  shape_config {
    ocpus = var.cpu
    memory_in_gbs = var.memory
  }

  source_details {
    source_type = "image"
    source_id = oci_core_image.image.id
  }
  preserve_boot_volume = false

  create_vnic_details {
    subnetId = data.oci_core_subnet.primary.id

    display_name = data.oci_core_subnet.display_name
    hostname_label = var.name
  }
}

resource "oci_core_instance_console_connection" "console" {
  instance_id = oci_core_instance.instance.id
  public_key = var.public_key
}