import 'package:flutter/material.dart';
import 'package:trending_github/api_services.dart';
import 'package:trending_github/repo_model.dart';
class GitHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getRepositories();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey[800],
        title: Text("Trending Repositories"),
        centerTitle: true,
      ),

      backgroundColor: Colors.blueGrey[800],
      body:FutureBuilder(
        future: getRepositories(),
          builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              
                itemCount: snapshot.data.length,
                itemBuilder: (context,index)=>RepoCard(
                  repoList: snapshot.data[index],
                ),
            );
          }
           else{
            return Center(child: CircularProgressIndicator());
          }
          }
      ),
      //RepoCard(),

    );
  }

}
class RepoCard extends StatelessWidget{
  final RepoList repoList;
  RepoCard({
    @required this.repoList});
  @override
  Widget build(BuildContext context) {
    getAvatar(){
      return CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(repoList.avatar),
      );
    }
    getRepoInfo(){

      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.blueGrey[800],fontSize: 16.0),
                children: <TextSpan>[
                  TextSpan(text: '${repoList.username}/',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: repoList.repo.name,)
                ]
              )
            ),
            Text(repoList.repo.description)

          ],
        ),
      );
    }
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getAvatar(),
            SizedBox(width: 10.0,),
            getRepoInfo(),
          ],
        ),
      ),
    );


  }

}

/*ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index)=>RepoCard()
      ),*/