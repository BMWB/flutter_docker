const vscode = require('vscode');
const fs = require('fs');
const path = require('path');
const configTemplate1 = require('./src/base_template/base_template');
const configTemplate2 = require('./src/list_template/list_template');

function activate(context) {
  console.log('Congratulations, your extension "fluttermvvmexample" is now active!');

  let disposable = vscode.commands.registerCommand('fluttermvvmexample.helloWorld', function (args) {
    const templateOptions = [
      { label: 'Template 1', description: 'Template Base' },
      { label: 'Template 2', description: 'Template List' },
    ];

    vscode.window.showQuickPick(templateOptions, { placeHolder: 'Select a template' }).then((selectedTemplate) => {
      if (selectedTemplate) {
        vscode.window.showInputBox({
          prompt: 'Enter the class name'
        }).then((inputName) => {
          if (inputName !== undefined && inputName.trim() !== '') {
            useExtension(args, selectedTemplate, inputName).then(() => {
              vscode.window.showInformationMessage('开发VS Code插件成功!');
            }).catch((error) => {
              console.error(error);
            });
          }
        });
      }
    });
  });

  context.subscriptions.push(disposable);
}

function deactivate() {}

const useExtension = (args, selectedTemplate, inputName) => {
  return new Promise((resolve, reject) => {
    try {
      const workspaceFolders = vscode.workspace.workspaceFolders;
      if (!workspaceFolders || workspaceFolders.length === 0) {
        vscode.window.showErrorMessage('请先打开一个工作区');
        reject('');
        return;
      }

      const selectPath = args.path;
      const directoryPath = path.join(selectPath, inputName);

      if (fs.existsSync(directoryPath)) {
        vscode.window.showErrorMessage('该目录下已存在相应的文件夹！');
        reject('');
        return;
      }

      fs.mkdirSync(directoryPath);

      const viewmodelFilePath = path.join(directoryPath, 'viewmodel', `${inputName.toLowerCase()}_viewmodel.dart`);
      const modelFilePath = path.join(directoryPath, 'model', `${inputName.toLowerCase()}_model.dart`);
      const pagesFilePath = path.join(directoryPath, 'pages', `${inputName.toLowerCase()}_page.dart`);
      const viewGitKeepPath = path.join(directoryPath, 'views', '.gitkeep');
      const entityGitKeepPath = path.join(directoryPath, 'entity', `${inputName.toLowerCase()}_entity.dart`);

      fs.mkdirSync(path.join(directoryPath, 'viewmodel'));
      fs.mkdirSync(path.join(directoryPath, 'model'));
      fs.mkdirSync(path.join(directoryPath, 'pages'));
      fs.mkdirSync(path.join(directoryPath, 'views'));
      fs.mkdirSync(path.join(directoryPath, 'entity'));

      const capitalizedInputName = inputName.charAt(0).toUpperCase() + inputName.slice(1);

      if (selectedTemplate.label === 'Template 1') {
        let temp_vm = configTemplate1.temp_vm.replace(/example_/g, `${inputName}_`);
        temp_vm = temp_vm.replace(/Example/g, capitalizedInputName);

        let temp_page = configTemplate1.temp_page.replace(/example_/g, `${inputName}_`);
        temp_page = temp_page.replace(/Example/g, capitalizedInputName);


        let temp_model = configTemplate1.temp_model.replace(/example_/g, `${inputName}_`);
        temp_model = temp_model.replace(/Example/g, capitalizedInputName);

        let temp_vo = configTemplate1.temp_vo.replace(/example_/g, `${inputName}_`);
        temp_vo = temp_vo.replace(/Example/g, capitalizedInputName);



     
        fs.writeFileSync(viewmodelFilePath, temp_vm);
        fs.writeFileSync(modelFilePath, temp_model);
        fs.writeFileSync(pagesFilePath, temp_page);
        fs.writeFileSync(viewGitKeepPath, '');
        fs.writeFileSync(entityGitKeepPath, temp_vo);
      } else if (selectedTemplate.label === 'Template 2') {
        // Logic for Template 2
        let temp_vm = configTemplate2.temp_vm.replace(/example_/g, `${inputName}_`);
        temp_vm = temp_vm.replace(/Example/g, capitalizedInputName);

        let temp_page = configTemplate2.temp_page.replace(/example_/g, `${inputName}_`);
        temp_page = temp_page.replace(/Example/g, capitalizedInputName);


        let temp_model = configTemplate2.temp_model.replace(/example_/g, `${inputName}_`);
        temp_model = temp_model.replace(/Example/g, capitalizedInputName);

        let temp_vo = configTemplate2.temp_vo.replace(/example_/g, `${inputName}_`);
        temp_vo = temp_vo.replace(/Example/g, capitalizedInputName);

        fs.writeFileSync(viewmodelFilePath, temp_vm);
        fs.writeFileSync(modelFilePath, temp_model);
        fs.writeFileSync(pagesFilePath, temp_page);
        fs.writeFileSync(viewGitKeepPath, '');
        fs.writeFileSync(entityGitKeepPath, temp_vo);
      }

      resolve('');
    } catch (error) {
      reject(error);
    }
  });
}

module.exports = {
  activate,
  deactivate
};