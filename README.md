# terraform-http-statuscake-whitelist
Terraform Module that returns the latest StatusCake IP Whitelist: https://www.statuscake.com/kb/knowledge-base/what-are-your-ips/

This module scrapes the IP's used by Status Cake from their website and exposes it as a list to be consumed for whitelisting. The [ status cake website ](https://www.statuscake.com/kb/knowledge-base/what-are-your-ips/) points to the following files for IP's to use: 

- https://app.statuscake.com/Workfloor/Locations.php?format=txt

They have also mentioned the following 3 IP's that they use for SSL: 

- 162.243.141.135
- 107.170.235.240
- 104.236.163.90

Note: This currently does not support IP's that are used for page speed by statuscake as they do not provide txt format for those IP's. 

# Usage

```hcl

module "statuscake-whitelist" {
  source  = "github.com/vaibhavkhurana2018/terraform-http-statuscake-whitelist"
}

resource "aws_security_group_rule" "allow_all_from_statuscake" {
  type            = "ingress"
  from_port       = 0
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = ["${module.statuscake-whitelist.ipsr}"]
  security_group_id = "sg-123456"
}
```
# Outputs

ips = "List of ip's used by status cake."

# LICENSE

Licensed under MIT. See [vaibhavkhurana2018.mit-license.org](https://vaibhavkhurana2018.mit-license.org/) for complete text.

# Thanks

Would like to thank [ Nemo ](https://github.com/captn3m0) for module reference. 