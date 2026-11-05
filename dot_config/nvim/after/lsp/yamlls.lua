---@type vim.lsp.Config
return {
	settings = {
		yaml = {
			-- Kubernetes manifests are validated only where the path says so; other YAML
			-- (ArgoCD CRDs, Ansible, CI) keeps SchemaStore schemas and avoids false errors.
			schemas = {
				kubernetes = { "k8s/**/*.{yml,yaml}", "*.k8s.{yml,yaml}" },
			},
		},
	},
}
