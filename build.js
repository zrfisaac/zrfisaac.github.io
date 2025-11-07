// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ node ]

// # - begin
console.log('[ begin ]');
console.log();

const fs = require('fs');
const path = require('path');
const srcDir = './source';
const build = './build.json';
const languages = ['en', 'es', 'it', 'ja', 'pt', 'zh'];
const translations = JSON.parse(fs.readFileSync(build, 'utf8'));

// # - main
console.log('# [ main ]');
function translateContent(content, lang) {
	return content.replace(/\{(\w+)\}/g, (match, key) => {
		return translations[key] && translations[key][lang] ? translations[key][lang] : match;
	});
}
function processFiles(srcPath, lang) {
	fs.readdirSync(srcPath).forEach(file => {
		const filePath = path.join(srcPath, file);
		const destPath = path.join(`./${lang}`, path.relative(srcDir, filePath));

		if (fs.statSync(filePath).isDirectory()) {
			fs.mkdirSync(destPath, { recursive: true });
			processFiles(filePath, lang);
		} else if (path.extname(file) === '.html') {
			const content = fs.readFileSync(filePath, 'utf8');
			const translatedContent = translateContent(content, lang);
			fs.writeFileSync(destPath, translatedContent, 'utf8');
			console.log(`# - : ${destPath}`);
		}
	});
}
languages.forEach(lang => {
    fs.mkdirSync(`./${lang}`, { recursive: true });
    processFiles(srcDir, lang);
});
console.log();

// # - begin
console.log('# [ end ]');
console.log();
