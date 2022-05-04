require_relative 'spec_helper'
require 'json'
require 'generamba/code_generation/code_module.rb'
require 'generamba/constants/rambafile_constants.rb'

describe 'GenCommandTableParametersFormatter' do

  describe 'method prepare_parameters_for_displaying' do
    it 'should convert array of hash to array of strings' do
      expected_params = {}

      expected_params['Targets'] = 'Target'
      expected_params['Module path'] = Pathname.new('Project/name')
      expected_params['Module group path'] = Pathname.new('Project/Modules/name')
      expected_params['Test targets'] = 'TargetTests'
      expected_params['Test file path'] = Pathname.new('ProjectTests/name')
      expected_params['Test group path'] = Pathname.new('ProjectTests/Modules/name')
      expected_params['Template'] = 'Template'
      expected_params['Custom parameters'] = {:key => 'value'}.to_json
      expected_params['Test unit target'] = 'UnitTarget'
      # expected_params['Test unit path'] = Pathname.new('UnitTarget/Modules')
      expected_params['Test unit testable import'] = 'Target'

      expected_params['Test snapshot target'] = 'SnapshotTarget'
      # expected_params['Test snapshot path'] = Pathname.new('SnapshotTarget/Modules')
      expected_params['Test snapshot testable import'] = 'Target'

      rambafile = {}
      rambafile[Generamba::PROJECT_NAME_KEY] = 'project'
      rambafile[Generamba::PROJECT_FILE_PATH_KEY] = 'file_path'
      rambafile[Generamba::PROJECT_GROUP_PATH_KEY] = 'group_path'
      rambafile[Generamba::PROJECT_TARGET_KEY] = 'Target'
      rambafile[Generamba::PROJECT_FILE_PATH_KEY] = 'Project'
      rambafile[Generamba::PROJECT_GROUP_PATH_KEY] = 'Project/Modules'
      rambafile[Generamba::TEST_TARGET_KEY] = 'TargetTests'
      rambafile[Generamba::TEST_FILE_PATH_KEY] = 'ProjectTests'
      rambafile[Generamba::TEST_GROUP_PATH_KEY] = 'ProjectTests/Modules'
      
      rambafile[Generamba::TEST_UNIT_TARGET_KEY] = 'UnitTarget'
      # rambafile[Generamba::TEST_UNIT_PATH_KEY] = 'UnitTarget/Modules'
      rambafile[Generamba::TEST_UNIT_TESTABLE_IMPORT] = 'Target'

      rambafile[Generamba::TEST_SNAPSHOT_TARGET_KEY] = 'SnapshotTarget'
      # rambafile[Generamba::TEST_SNAPSHOT_PATH_KEY] = 'SnapshotTarget/Modules'
      rambafile[Generamba::TEST_SNAPSHOT_TESTABLE_IMPORT] = 'Target'

      options = {}
      options[:custom_parameters] = {:key => 'value'}

      code_module = Generamba::CodeModule.new('name', rambafile, options)
      template_name = 'Template'

      params = Generamba::GenCommandTableParametersFormatter.prepare_parameters_for_displaying(code_module, template_name)

      expect(params).to eq(expected_params)
    end
  end

end
