void main() {
  // Define a Map to store brand names, ratings, and locations
  Map<String, Map<String, String>> brandInfo = {
    //rating out of 5, location, price range (1 = $, 2 = $$ etc), company description 
    'Pull&Bear': {
      'rating': '2', 
      'location': 'Spain', 
      'price range': '1', 
      'sustainability practices': 'Pull&Bear uses recycled packaging and has set goals to reduce emissions produced by their factories. However, there is little to no evidence of the progress towards the target. Pull&Bear does use eco-friendly materials but it is not clear whether textile waste in the manufacturing process is actually enforced.'
    },

    'Zara': {
      'rating': '2', 
      'location': 'Spain', 
      'price range': '1', 
      'sustainability practices': 'Zara uses few eco-friendly materials, and has set goals to reduce greenhouse emisions produced by their manufacturers. However, there is little to no evidence oef the progress towards the target. Additionally, there is no evidence of efforts to minimize textile waste during production.'
    },

    'Uniqlo': {
      'rating': '3', 
      'location': 'Japan', 
      'price range': '1', 
      'sustainability practices': 'Uniqlo offers clothing with lower-impact materials such as recycled materials, as well as a recycling program for their customers. There are some policies implemented to decrease water consumption during production, as well as science based targets to cut down greenhosue emissions, but there is no evidence the goals are on their track.'
    },

    'Patagonia': {
      'rating': '4', 
      'location': 'United States', 
      'price range': '3', 
      'sustainability practices': 'Patagonia uses a high proportion fo lower-impact materials such as recycled materials. These materials also help limit the use of chemicals, water, and wastewater during the manufacturing process. Besides offering a recycling service for its costumers, it also uses a medium proportion of bluesign certified fabrics.'
    },

    "Levi's": {
      'rating': '4', 
      'location': 'United States', 
      'price range': '2', 
      'sustainability practices': "Levi's has science-based targets to rude emissions from their supply chain and is on track to meet its target. It met its Zero Discharge of Hazardous Chemicals Group (ZDHC) target, which aims to eliminate hazardous chemicals from its supply chain. Levi's also uses some ecofriendly materials such as recycled materials."
    },

    // Add more brand information as needed
  };

  // Accessing and printing brand information
  print('Brand1: ${brandInfo['Brand1']}');
  print('Brand2: ${brandInfo['Brand2']}');
  print('Brand3: ${brandInfo['Brand3']}');
}