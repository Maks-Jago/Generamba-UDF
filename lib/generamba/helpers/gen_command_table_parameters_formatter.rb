module Generamba
  # Provides methods for prepare parameters for displaying in table.
  class GenCommandTableParametersFormatter
    require 'json'

    # This method prepared parameter for displaying
    def self.prepare_parameters_for_displaying(code_module, template_name)
      params = {}

      params['Targets'] = code_module.project_targets.join(',') if code_module.project_targets
      params['Module path'] = code_module.project_file_path if code_module.project_file_path

      if code_module.project_file_path != code_module.project_group_path
        params['Module group path'] = code_module.project_group_path
      end

      params['Test targets'] = code_module.test_targets.join(',') if code_module.test_targets
      params['Test file path'] = code_module.test_file_path if code_module.test_file_path

      if code_module.test_file_path != code_module.test_group_path
        params['Test group path'] = code_module.test_group_path
      end

      params['Test unit target'] = code_module.test_unit_target if code_module.test_unit_target
      params['Test unit path'] = code_module.test_unit_path if code_module.test_unit_path
      params['Test unit testable import'] = code_module.test_unit_testable_import if code_module.test_unit_testable_import

      params['Test snapshot target'] = code_module.test_snapshot_target if code_module.test_snapshot_target
      params['Test snapshot path'] = code_module.test_snapshot_path if code_module.test_snapshot_path
      params['Test snapshot testable import'] = code_module.test_snapshot_testable_import if code_module.test_snapshot_testable_import

      params['Template'] = template_name

      unless code_module.custom_parameters.empty?
        params['Custom parameters'] = code_module.custom_parameters.to_json
      end

      params
    end
  end
end
