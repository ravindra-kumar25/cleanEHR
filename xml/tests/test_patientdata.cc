#define CATCH_CONFIG_MAIN
#include "catch.hpp"
#include "ccxml.h"

TEST_CASE() {
  auto data_info = DataInfo("/Users/sinan/workspace/projects/UCLH/data-play/xml/data/data_item.csv");
  pugi::xml_document doc;
  pugi::xml_parse_result result = doc.load_file("/Users/sinan/workspace/projects/UCLH/data-play/xml/data/cc.xml");
  if (!result) std::cout << result.description() << std::endl;

  pugi::xml_node root = doc.document_element();
  auto context_node = root.first_child().first_child();
  xml_node patient1_node = context_node.next_sibling().first_child();

  PatientData pd1 = PatientData(patient1_node, data_info);
  PatientData pd2 = PatientData(patient1_node.next_sibling().next_sibling(), data_info);

  CHECK(pd1.simple_data.find("NIHR_HIC_ICU_0073") != pd1.simple_data.end());
  CHECK(pd1.simple_data["NIHR_HIC_ICU_0073"] == "57fb752c860311e4ae76005056b34847");
  CHECK(pd2.simple_data.find("NIHR_HIC_ICU_0073") != pd2.simple_data.end());
  CHECK(pd2.simple_data["NIHR_HIC_ICU_0073"] == "5824fa28860311e4ae76005056b34847");


  // heart rate
  auto heart_rate_time = pd1.time_data["NIHR_HIC_ICU_0279"]["time"];
  auto heart_rate_value = pd1.time_data["NIHR_HIC_ICU_0279"]["val"];

//  for (auto i : pd1.time_data["NIHR_HIC_ICU_0279"]["time"])
    std::cout << pd1.time_data["NIHR_HIC_ICU_0279"]["time"].size();

//  for (int i = 0 ; i < heart_rate_time.size(); ++i )
//    std::cout << heart_rate_time[i] << " = " << heart_rate_value[i] <<"\n";
}


