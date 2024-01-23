import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Contact.dart';
import 'package:todo_list/main.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = contacts.map((contact) => '${contact
      .name} ${contact.surname} ${contact.phoneNumber}').toList();

  @override
  List<IconButton> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    List<Contact> matchedContacts = [];

    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
        matchedContacts.add(contacts[searchTerms.indexOf(term)]);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            showContactDetails(context, index, matchedContacts);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    List<Contact> matchedContacts = [];

    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
        matchedContacts.add(contacts[searchTerms.indexOf(term)]);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            showContactDetails(context, index, matchedContacts);
          },
        );
      },
    );
  }
}
