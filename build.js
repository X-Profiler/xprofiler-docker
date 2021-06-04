
var download = require('github-download')

function dl (repo) {
    return new Promise(function (resolve, reject) {
        download({user: 'X-Profiler', repo: repo, ref: 'master'}, 'src/' + repo).on('end', function() {
            
            resolve()
        })
 
    }).catch(function(err){
        console.log(err)
    })
}



Promise.all([
    dl("xprofiler-console"),
    dl("xprofiler-manager"),
    dl("xprofiler-server")
]).then(function(){
    console.log('done')
})